# frozen_string_literal: true

module HomeHelper
  # rubocop:disable Metrics/AbcSize
  def family_count
    families = current_user.organization.sheltereds.active.where.not(
      sheltered_id: nil
    ).pluck(:sheltered_id).uniq.size.to_i
    alone_people = current_user.organization.sheltereds.active.where.not(
      id: Sheltered.select(:sheltered_id)
    ).where(sheltered_id: nil).count.to_i

    families + alone_people
  end
  # rubocop:enable Metrics/AbcSize
end
