import React from 'react';
import axios from 'axios'
import {Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper} from '@material-ui/core';

const TransactionTypeList = () => {
  const [transactionTypeList, setTransactionTypeList] = React.useState([]);
  const [loading, setLoading] = React.useState(true);

  React.useEffect(() => {
    axios.get('http://localhost:3000/transaction_types').then((response) => {
      setLoading(false);
      setTransactionTypeList(response.data);
    })
  }, []);

  return (
    <>
      <TableContainer component={Paper}>
        <Table stickyHeader>
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell>Código</TableCell>
              <TableCell>Descrição</TableCell>
              <TableCell>Natureza</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {
              transactionTypeList.map((transactionType) => {
                return(
                  <TableRow key={transactionType.id}>
                    <TableCell>{transactionType.id}</TableCell>
                    <TableCell>{transactionType.code}</TableCell>
                    <TableCell>{transactionType.description}</TableCell>
                    <TableCell>{transactionType.income == true ? 'Crédito' : 'Débito'}</TableCell>
                    <TableCell>AÇÕES</TableCell>
                  </TableRow>
                );
              })
            }
          </TableBody>
        </Table>
      </TableContainer>
      {loading && 'Carregando...'}
    </>
  );
}

export default TransactionTypeList;
