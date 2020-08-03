set :environment, 'development'
set :output, 'log/cron.log'

every 5.minutes do
  runner 'ClientInfo.new.execute'
end

every 5.minutes do
  runner 'ClientRevenue.new.execute'
end
