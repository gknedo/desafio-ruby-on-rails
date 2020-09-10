# frozen_string_literal: true

class BatchImport < ApplicationRecord
  before_create :set_defaults

  enum status: {
    processing: 1,
    completed: 2
  }

  def import! file
    File.open(file.path, "r").each_line do |line|
      import_line!(line)
    end
    update!(status: :completed)
  end

  def import_line! line
    transaction_type = TransactionType.find_by(code: line[0])
    transacted_at = DateTime.new(line[1..4].to_i, line[5..6].to_i, line[7..8].to_i,line[42..43].to_i,line[44..45].to_i,line[46..47].to_i)
    store = Store.where(name: line[62..80].titleize.squeeze.strip, owner_name: line[48..61].titleize.squeeze.strip).first_or_create
    value = line[9..18]
    cpf = line[19..29]
    card = line[30..41]
    Transaction.create(transaction_type: transaction_type, store: store, value: value, cpf: cpf, card: card, transacted_at: transacted_at)
  end

  private

  def set_defaults
    self.status ||= 1
  end
end
