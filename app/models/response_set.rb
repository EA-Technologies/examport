class ResponseSet < ActiveRecord::Base
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |response|
        csv << response.attributes.values_at(*column_names)
      end
    end
  end
end

