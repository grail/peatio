namespace :peatio do
  task feed: :environment do
    members       = [MembersFeeder.new.feed, AdminsFeeder.new.feed].flatten
    longest_email = members.map(&:email).sort_by(&:length).last
    members.each do |member|
      Rails.logger << "#{member.admin? ? 'ADMIN ' : 'MEMBER'} #{member.email.ljust(longest_email.length)} #{member.password}\n"
    end
  end
end
