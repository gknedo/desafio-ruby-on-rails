import React from 'react';
import axios from 'axios'
import {Button, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper} from '@material-ui/core';

const BatchImportList = ({createEnabled}) => {
  const [batchImportList, setBatchImportList] = React.useState([]);
  const [loading, setLoading] = React.useState(true);

  const loadBatchList = () => {
    axios.get('http://localhost:3000/batch_imports').then((response) => {
      setLoading(false);
      setBatchImportList(response.data);
    });
  }

  React.useEffect(() => {
    loadBatchList();
  }, []);

  const [file, setFile] = React.useState();

  const onChange = (e) => {
    setFile(e.target.files[0]);
  }

  const onFormSubmit = (e) => {
    e.preventDefault();
    let formData = new FormData();
    if (file) {
      setLoading(true);

      formData.append("file", file);
      fetch('http://localhost:3000/batch_imports', {
        method: 'POST',
        body: formData
      }).then((response) => {
        loadBatchList();
        setFile(null);
      });
    }
  }

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
                    <TableCell>{batch_import.id}</TableCell>
                    <TableCell>{batch_import.status}</TableCell>
                    <TableCell align='right'>AÇÕES</TableCell>
                  </TableRow>
                );
              })
            }
          </TableBody>
        </Table>
      </TableContainer>
      {loading && 'Carregando...'}
      { createEnabled &&
        <form onSubmit={onFormSubmit}>
          <input type="file" label="Selecionar Arquivo" onChange={onChange}/>
          <Button type="submit">Enviar</Button>
        </form>
      }
    </>
  );
}

export default BatchImportList;
