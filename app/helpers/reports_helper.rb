# frozen_string_literal: true

module ReportsHelper
  def children_report(sheltered_list)
    @children_report ||= sheltered_list.filter(&:children?)
  end

  def teenagers_report(sheltered_list)
    @teenagers_report ||= sheltered_list.filter(&:teenager?)
  end

  def adults_report(sheltered_list)
    @adults_report ||= sheltered_list.filter(&:adult?)
  end

  def elderly_report(sheltered_list)
    @elderly_report ||= sheltered_list.filter(&:elderly?)
  end
end
