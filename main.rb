#Student Class
class Student
  attr_accessor :name
  attr_accessor :toan
  attr_accessor :van
  attr_accessor :anh
  attr_accessor :avg
  def initialize(name, toan, van, anh)
    @name = name
    @toan = toan
    @van = van
    @anh = anh
    @avg = self.trungBinhMon
  end

  def trungBinhMon
    (@toan + @van + @anh) / 3
  end
end

#Student Mangagement Class
class StudentManagement
  attr_accessor :studentList

  # def initialize()
  #   @studentList = []
  # end

  def initialize(list)
    @studentList = []
    if list != nil
      list.each do |name, info|
        newStudent = Student.new(name, info[:toan], info[:van], info[:anh])
        @studentList.push(newStudent)
      end
    end
  end

  def addStudent
    count = 0
    loop do 
      p 'ban muon them bao nhieu hoc sinh vao lop (Nhap so nguyen)'
      count = Integer(gets) rescue nil
      break if (count != nil)
    end 

    for i in 0..(count - 1)
      p 'Nhap ten'
      ten = gets.chomp.to_s
      
      p 'Nhap diem toan'
      toan = gets.chomp.to_f
  
      p 'Nhap diem van'
      van = gets.chomp.to_f
  
      p 'Nhap diem anh'
      anh = gets.chomp.to_f
      
      newStudent = Student.new(ten, toan, van, anh)
      @studentList.push(newStudent)
    end
  end

  def studentInfo
    @studentList.each do |student|
      p "Thong tin hoc sinh #{student.name}: toan #{student.toan}, van #{student.van}, anh #{student.anh}"
    end
  end

  def trungBinhMonCaoNhat
    max = 0
    ten = ''
    @studentList.each do |student|
      if max < student.avg
        max = student.avg
        ten = student.name
      end
    end
    p "Trung binh mon cao nhat la #{max}"
    p "Ten hoc sinh co diem cao nhat la #{ten}"
    end

end
  


#==========================================
#main
p 'Cau 1:'
studentManager = StudentManagement.new(nil)
studentManager.addStudent
studentManager.studentInfo
studentManager.trungBinhMonCaoNhat

p 'Cau 2:'
list = {"ngoc"=>{:toan=>3, :van=>4, :anh=>5, :avg=>4.0}, "thao"=>{:toan=>6, :van=>7, :anh=>8, :avg=>7.0}}

studentManager = StudentManagement.new(list)
studentManager.studentInfo
studentManager.trungBinhMonCaoNhat
  
