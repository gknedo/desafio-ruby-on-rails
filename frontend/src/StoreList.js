import React from 'react';
import axios from 'axios'
import { round } from './utils'
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Collapse,
  Box,
  Typography,
  IconButton,
} from '@material-ui/core';
import { KeyboardArrowUp, KeyboardArrowDown } from '@material-ui/icons';

const Row = ({id, name, ownerName, transactions}) => {
  console.log(transactions);
  const [open, setOpen] = React.useState(false);
  const balance = round(transactions.reduce((acc, curr) => { return curr.signed_value + acc }, 0)/100.0, 2).toFixed(2)
  return (
    <>
      <TableRow>
        <TableCell>{id}</TableCell>
        <TableCell>{name}</TableCell>
        <TableCell>{ownerName}</TableCell>
        <TableCell>R$ {balance}</TableCell>
        <TableCell>
          <IconButton aria-label="expand row" size="small" onClick={() => setOpen(!open)}>
            {open ? <KeyboardArrowUp /> : <KeyboardArrowDown />}
          </IconButton>
        </TableCell>
      </TableRow>
      <TableRow>
          <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={6}>
            <Collapse in={open} timeout="auto" unmountOnExit>
              <Box margin={1}>
                <Typography variant="h6" gutterBottom component="div">
                  Transações
                </Typography>
                <Table size="small" aria-label="purchases">
                  <TableHead>
                    <TableRow>
                      <TableCell>ID</TableCell>
                      <TableCell>Natureza</TableCell>
                      <TableCell>CPF</TableCell>
                      <TableCell align='right'>Valor</TableCell>
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {
                      transactions.map((transaction) => {
                        return(
                          <TableRow key={transaction.id}>
                            <TableCell>{transaction.id}</TableCell>
                            <TableCell>{transaction.transaction_type.description}</TableCell>
                            <TableCell>{transaction.cpf}</TableCell>
                            <TableCell align='right'>R$ {round(transaction.signed_value/100.0, 2).toFixed(2)}</TableCell>
                          </TableRow>
                        );
                      })
                    }
                  </TableBody>
                </Table>
              </Box>
            </Collapse>
          </TableCell>
        </TableRow>
      </>
  )
}

const StoreList = () => {
  const [storeList, setStoreList] = React.useState([]);
  const [transactionList, setTransactionList] = React.useState([]);
  const [loading, setLoading] = React.useState(true);

  React.useEffect(() => {
    axios.get('http://localhost:3000/stores').then((response) => {
      setStoreList(response.data);
      axios.get('http://localhost:3000/transactions').then((response) => {
        setLoading(false);
        setTransactionList(response.data);
      })
    });
  }, []);

  const getTransactions = (storeId) => {
    return transactionList.filter((transaction) => transaction.store_id == storeId);
  }

  return (
    <>
      <TableContainer component={Paper}>
        <Table stickyHeader>
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell>Nome</TableCell>
              <TableCell>Proprietário</TableCell>
              <TableCell>Saldo</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            { !loading &&
              storeList.map((store) => {
                return (
                  <Row
                    key={store.id}
                    id={store.id}
                    name={store.name}
                    ownerName={store.owner_name}
                    transactions={getTransactions(store.id)}
                  />
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

export default StoreList;
