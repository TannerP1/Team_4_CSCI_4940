import OpenAI from "openai";
import mysql from 'mysql';

const openai = new OpenAI({
  organization: 'org-SZ8abydGqTQlGHSfsaQJKnIR',
  project: 'proj_Iihv9DgeBnnmPsGMb8EVrJU5',
  apiKey: 'sk-proj-r22vBulYKoVifAPm5pcNT3BlbkFJ0AkLD0FhrAYd7ZjHE057'
});

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'CSCI4400',
  database: 'mydb'
});

// Connecting to the database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to database:', err);
    return;
  }
  console.log('Connected to the database');

  const query = `
    SELECT
      c.TABLE_NAME,
      GROUP_CONCAT(c.COLUMN_NAME) AS COLUMN_NAMES
    FROM
      information_schema.columns c
    WHERE
      c.TABLE_SCHEMA = 'mydb'
    GROUP BY
      c.TABLE_NAME
  `;

  connection.query(query, (err, rows) => {
    if (err) {
      console.error('Error retrieving table and column names:', err);
      return;
    }
    console.log('Tables and their columns:');
    rows.forEach((row) => {
      if (row.TABLE_NAME !== 'users' && row.TABLE_NAME !== 'user_events') {
        const selectQuery = `SELECT * FROM ${row.TABLE_NAME}`;
        connection.query(selectQuery, (err, dataRows) => {
          if (err) {
            console.error(`Error retrieving data from ${row.TABLE_NAME}:`, err);
            return;
          }
          const tableData = dataRows.map(JSON.stringify).join('\n');
          const prompt = `Data from ${row.TABLE_NAME}:\n${tableData}`;
          InteractWithBot(prompt); 
          if (row === rows[rows.length - 1]) {
            EndConnection();
          }
        });
      }
    });
  });
});

async function InteractWithBot(prompt) {
  try {
    const response = await openai.chat.completions.create({
      model: 'gpt-3.5-turbo',
      messages: [
        { role: 'system', content: 'Answer user question by genrating sql queries from plaintext and outputting the results of the query' },
        { role: 'user', content: prompt }
      ],
      
    });
    const botResponse = response.choices[0].message.content;
    console.log('Bot response:', botResponse);
  } catch (error) {
    console.error('Error:', error);
  }
}

function EndConnection() {
  connection.end((err) => {
    if (err) {
      console.error('Error closing database connection:', err);
      return;
    }
    console.log('Database connection closed');
  });
}
