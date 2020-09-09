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
      <Table>
        <TableHead>
          <TableRow>
            <TableCell>ID</TableCell>
            <TableCell>Loja</TableCell>
            <TableCell>Natureza</TableCell>
            <TableCell>CPF</TableCell>
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
                  <TableCell>R$ {round(transaction.signed_value/100.0, 2).toFixed(2)}</TableCell>
                  <TableCell>AÇÕES</TableCell>
                </TableRow>
              );
            })
          }
        </TableBody>
      </Table>
    </TableContainer>
  );
}

export default TransactionList;
