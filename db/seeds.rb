# frozen_string_literal: true

TransactionType.create!(code: 1, description: 'Débito', income: true)
TransactionType.create!(code: 2, description: 'Boleto', income: false)
TransactionType.create!(code: 3, description: 'Financiamento', income: false)
TransactionType.create!(code: 4, description: 'Crédito', income: true)
TransactionType.create!(code: 5, description: 'Recebimento Empréstimo', income: true)
TransactionType.create!(code: 6, description: 'Vendas', income: true)
TransactionType.create!(code: 7, description: 'Recebimento TED Entrada', income: true)
TransactionType.create!(code: 8, description: 'Recebimento DOC Entrada', income: true)
TransactionType.create!(code: 9, description: 'Aluguel', income: false)
