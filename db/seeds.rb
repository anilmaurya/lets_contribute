# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
LANGUAGE_NAMES = ['arc', 'assembly', 'c', 'c#', 'c++', 'css', 'clojure', 'coffeescript', 'coldfusion', 
             'commmonlisp', 'd', 'dylan', 'elixir', 'emacs lisp', 'erlang', 'fortran', 'fancy', 
             'gettext catalog', 'go', 'groovy', 'html', 'haskell', 'java', 'javascript', 'julia', 
             'objective-c', 'php', 'perl', 'powershell', 'python', 'racket', 'ruby',
             'rust', 'scala', 'scheme', 'shell', 'standard ml', 'tex', 'typescript', 'vala', 'viml']

LANGUAGE_NAMES.each do |name|
  Language.create(name: name)
end
