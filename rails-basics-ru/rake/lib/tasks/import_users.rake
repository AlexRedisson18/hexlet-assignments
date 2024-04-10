# frozen_string_literal: true

require 'csv'
require 'date'

namespace :hexlet do
  desc 'Import users from CSV file'
  task :import_users, [:file_path] => :environment do |_t, args|
    path = args[:file_path]
    csv_text = File.read(path)
    csv = CSV.parse(csv_text, headers: true)

    csv.each do |row|
      User.create!(row.to_hash.merge(birthday: Date.today))
    end
  end
end
