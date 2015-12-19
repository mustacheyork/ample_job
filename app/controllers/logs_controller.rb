class LogsController < ApplicationController

  protect_from_forgery :except => [:run] # CSRF対策を無効(後でcurlでテストするため)

  def run
    # 即時実行する場合
    AppLogJob.perform_later('ジョブを即時実行')
 
    # 時間を置いて実行する場合
    AppLogJob.set(wait: 5.second).perform_later('ジョブを5秒後に実行')
    AppLogJob.set(wait: 10.second).perform_later('ジョブを10秒後に実行')
 
    render :nothing => true
  end

end
