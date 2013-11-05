# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
range = 1..10
range.each do |i|
    user = User.create(email: "test#{i}@example.com", password: "password#{i}", password_confirmation: "password#{i}")
    book = Book.create(ISBN: "ISBN#{i}", total: i)
    BookInfo.create(title: "title#{i}", author: "author#{i}", publisher: "publisher#{i}", publish_time: Date.new(2008,8,8), ISBN: "ISBN#{i}")
    UserBook.create(acount: 1, user: user, book: book)
    UserInfo.create(name: "name#{i}", gender: false, location: "location#{i}", self_description: "I am number #{i}!", birthday: Date.new(2008, 8, i), user: user)
end

books = Book.create([{ISBN: 'ISBN 978-7-115-17850-3', total: 1},
                    #{ISBN: 'ISBN 978-7-111-07575-2', total: 1},
                    {ISBN: 'ISBN 978-7-111-25121-7', total: 1}])
book_infos = BookInfo.create([{title: '编译原理', author: 'Alfred V. Aho, Monica S. Lam, Ravi Sethi', publisher: '机械工业出版社', ISBN: 'ISBN 978-7-111-25121-7'},
                             #{title: '设计模式/可复用面向对象软件的基础', author: 'Eric Gamma, Richard Helm, Ralph Johnson', publisher: '机械工业出版社', book: books.find_by ISBN: 'ISBN 978-7-111-07575-2'},
                             {title: 'Python核心编程', author: 'Wesley J. Chun', publisher: '人民邮电出版社', ISBN: 'ISBN 978-7-115-17850-3'}])

UserBook.create(acount: 1, book: books.first, user: User.first)
UserBook.create(acount: 1, book: books.last, user: User.first)
