class LeadsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(leads_file)
    CSV.foreach(leads_file, headers: true) do |lead|
      Customer.create(email: leads[0], first_name: leads[1], last_name: leads[2])
    end
  end

end
