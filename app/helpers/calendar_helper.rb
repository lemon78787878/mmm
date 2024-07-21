module CalendarHelper
  def custom_month_calendar(&block)
    month_calendar(
      title: ->(start_date) { start_date.strftime("%Y年 %-m月") },
      &block
    )
  end
end