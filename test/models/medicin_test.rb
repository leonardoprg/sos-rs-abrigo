# frozen_string_literal: true

require 'test_helper'

class MedicinTest < ActiveSupport::TestCase
  test 'should be valid with a name' do
    medicin = Medicin.new(name: 'Paracetamol')
    assert medicin.valid?
  end

  test 'should be invalid without a name' do
    medicin = Medicin.new(name: nil)
    assert_not medicin.valid?
    assert_equal ['não pode ficar em branco'], medicin.errors[:name]
  end

  test 'should be invalid with a duplicate name' do
    Medicin.create(name: 'Paracetamol')
    medicin = Medicin.new(name: 'Paracetamol')
    assert_not medicin.valid?
    assert_equal ['já está em uso'], medicin.errors[:name]
  end
end
