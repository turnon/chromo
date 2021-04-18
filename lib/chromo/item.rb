require 'enumark'

module Chromo
  class Item
    include Mongoid::Document

    store_in collection: 'items'

    field :backup_at, type: String
    field :name, type: String
    field :href, type: String
    field :host, type: String
    field :ancestors, type: Array
    field :category, type: String

    class << self
      def insert_many(file)
        date = File.basename(file, '.html')
        items = Enumark.new(file).map do |m|
          {
            backup_at: date,
            name: m.name,
            href: m.href,
            host: m.host,
            ancestors: m.categories[0..-2].map(&:to_s),
            category: m.categories[-1].to_s
          }
        end
        collection.insert_many(items)
      end
    end

  end
end
