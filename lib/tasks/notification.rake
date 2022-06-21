namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime"
  task sms: :environment do
    User.all.each do |user|
      SmsTool.send_sms()
    end
  end
end

# 11 dígitos
# +55 na frente