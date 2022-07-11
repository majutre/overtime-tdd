namespace :notification do
  desc 'Sends mail notification to managers (admin users) each day to inform pending overtime requests'
  task manager_email: :environment do
    pending_posts = Post.pending
    admin_users = AdminUser.all

    if pending_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.daily_overtime_email(admin).deliver_later
      end
    end
  end
end