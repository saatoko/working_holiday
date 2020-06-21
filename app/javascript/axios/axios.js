import axios from 'axios'

const API_URL = 'http://localhost:3000'

// インスタンスを作る
const securedAxiosInstance = axios.create ({
  baseURL: API_URL,
  // 認証情報(クッキー)を送るためにCredentialsはtrueにする
  withCredentials: true,
  headers: {
    // 送信するのはJSON
    'Content-Type': 'application/json'
  } 
})

const plainAxiosInstance = axios.create ({
  baseURL: API_URL,
  withCredentials: true,
  headers: {
    'Content-Type': 'application/json'
  } 
})


// 全体を通して共通させたい処理(エラーハンドリングなど)がある場合、interceptorsを使って処理に割り込むことができる
// リクエストのとき、動的にヘッダーにCSRFトークンをセットする
securedAxiosInstance.interceptors.request.use(config => {
  const method = config.method.toUpperCase();
  if (method !== 'OPTIONS' && method !== 'GET') {
    config.headers = {
      ...config.headers,
      // localStorageの値をセット
      'X-CSRF-TOKEN': localStorage.csrf
    }
  }
  return config
});


// レスポンスで401エラーが帰ってきたとき、トークンの再発行を依頼
securedAxiosInstance.interceptors.response.use(null, error => {
  if (error.response && error.response.config && error.response.status === 401) {
    return plainAxiosInstance.post('/api/refresh', {}, { headers: { 'X-CSRF-TOKEN': localStorage.csrf } })
    .then(response => {
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true

      let retryConfig = error.response.config
      retryConfig.headers['X-CSRF-TOKEN'] = localStorage.csrf
      return plainAxiosInstance.request(retryConfig)

    // catch部分でエラーを検知
    }).catch(error => {
      delete localStorage.csrf
      delete localStorage.signedIn

      location.replace('/api/signin')
      return Promise.reject(error)
    })
  } else {
    return Promise.reject(error)
  }
})

// exportしておく
export { securedAxiosInstance, plainAxiosInstance }