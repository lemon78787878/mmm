module DiariesHelper
  def custom_month_calendar(&block)
    month_calendar(
      title: ->(start_date) { start_date.strftime("%Y年 %-m月") },
      day_names: I18n.t('date.day_names'), # ここで曜日を設定
      previous_link: ->(param, date_range) { link_to '先月', param },
      next_link: ->(param, date_range) { link_to '次月', param },
      today_link: -> { link_to '今月', { month: Date.current.month, year: Date.current.year } },
      &block
    )
  end
end
