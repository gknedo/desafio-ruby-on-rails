import React from 'react';
import axios from 'axios'
import {Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper} from '@material-ui/core';
import {round} from './utils'

const BatchImportList = ({createEnabled}) => {
  const [batchImportList, setBatchImportList] = React.useState([]);
  const [loading, setLoading] = React.useState(true);

  React.useEffect(() => {
    axios.get('http://localhost:3000/batch_imports').then((response) => {
      setLoading(false);
      setBatchImportList(response.data);
    })
  }, []);


  return (
    <>
      <TableContainer component={Paper}>
        <Table stickyHeader>
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell>Status</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {
              batchImportList.map((batch_import) => {
                return(
                  <TableRow key={batch_import.id}>
                    <TableCell>{batch_import.status}</TableCell>
                    <TableCell align='right'>AÇÕES</TableCell>
                  </TableRow>
                );
              })
            }
            {loading && 'Carregando...'}
          </TableBody>
        </Table>
      </TableContainer>
      { createEnabled &&
        'Oi'
      }
    </>
  );
}

export default BatchImportList;
