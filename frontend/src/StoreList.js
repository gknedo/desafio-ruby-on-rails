import React from 'react';
import axios from 'axios'
import {Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper} from '@material-ui/core';

const StoreList = () => {
  const [storeList, setStoreList] = React.useState([]);
  const [loading, setLoading] = React.useState(true);

  React.useEffect(() => {
    axios.get('http://localhost:3000/stores').then((response) => {
      setLoading(false);
      setStoreList(response.data);
    })
  }, []);

  if(loading == true) return 'Carregando...';

  return (
    <TableContainer component={Paper}>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell>ID</TableCell>
            <TableCell>Nome</TableCell>
            <TableCell>Proprietário</TableCell>
            <TableCell></TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {
            storeList.map((store) => {
              return(
                <TableRow key={store.id}>
                  <TableCell>{store.id}</TableCell>
                  <TableCell>{store.name}</TableCell>
                  <TableCell>{store.owner_name}</TableCell>
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

export default StoreList;
