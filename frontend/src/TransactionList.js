import React from 'react';
import axios from 'axios'
import {Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper} from '@material-ui/core';
import {round} from './utils'

const TransactionList = () => {
  const [transactionList, setTransactionList] = React.useState([]);
  const [loading, setLoading] = React.useState(true);

  React.useEffect(() => {
    axios.get('http://localhost:3000/transactions').then((response) => {
      setLoading(false);
      setTransactionList(response.data);
    })
  }, []);

  if(loading == true) return 'Carregando...';

  return (
    <TableContainer component={Paper}>
      <Table stickyHeader>
        <TableHead>
          <TableRow>
            <TableCell>ID</TableCell>
            <TableCell>Natureza</TableCell>
            <TableCell>Loja</TableCell>
            <TableCell>CPF</TableCell>
            <TableCell align='right'>Valor</TableCell>
            <TableCell></TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {
            transactionList.map((transaction) => {
              return(
                <TableRow key={transaction.id}>
                  <TableCell>{transaction.id}</TableCell>
                  <TableCell>{transaction.transaction_type.description}</TableCell>
                  <TableCell>{transaction.store.name}</TableCell>
                  <TableCell>{transaction.cpf}</TableCell>
                  <TableCell align='right'>R$ {round(transaction.signed_value/100.0, 2).toFixed(2)}</TableCell>
                  <TableCell align='right'>AÇÕES</TableCell>
                </TableRow>
              );
            })
          }

          <TableRow>
            <TableCell colSpan={4}><strong>Total</strong></TableCell>
            <TableCell align="right"><strong>R$ {round(transactionList.reduce((acc, curr) => { return curr.signed_value + acc }, 0)/100.0, 2).toFixed(2)}</strong></TableCell>
          </TableRow>
        </TableBody>
      </Table>
    </TableContainer>
  );
}

export default TransactionList;
