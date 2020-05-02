class Profession < ActiveHash::Base
  self.data = [
      {id: 1, name: '社会人'}, {id: 2, name: '大学生'}, {id: 3, name: '専門学校生'}
  ]
end