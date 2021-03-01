namespace :carts do
  desc "Delete all unused carts"
  task delete_carts: :environment do
    UnusedCartJob.perform_later
  end
end

# If i want to be only once a week
# UnusedCartJob.perform_later if Date.today.sunday?
