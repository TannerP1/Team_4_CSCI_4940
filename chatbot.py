import openai
import mysql.connector

openai.api_key = 'sk-proj-ixwce7IQ6QS0toYawyWsT3BlbkFJeEWwZB1goVCsZNKShGPO'

# Establishing a connection to the MySQL database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="CSCI4400",
    database="mydb"
)
# Create a cursor object to allow database queries
cursor = conn.cursor()

def askBot():
        # Fetch some information from the database
        cursor.execute("SELECT * FROM gen_events LIMIT 1")
        result = cursor.fetchone()

        # Assuming the 'event_name' column is the first column in the result tuple
        event_name = result[0]
        # Construct a prompt based on the retrieved information
        prompt = input("Me: ")
        
        print("Constructed Prompt:", prompt)

        # Send the prompt to GPT-3.5-turbo for context understanding
        response = openai.Completion.create(
            engine="gpt-3.5-turbo-instruct", 
            prompt=prompt,
            temperature=0.1,
            max_tokens=30
        )
        interpreted_input = response.choices[0].text.strip()
        return interpreted_input

# Call the function to interact with GPT-3.5-turbo based on database information
while True:
    interpreted_input = askBot()
    if interpreted_input.lower() == "quit" or interpreted_input.lower() == "bye" or interpreted_input.lower() == "stop":
        break
    else:
        print("Interpreted Input:", interpreted_input)

# Close the cursor and commit any changes to the database
cursor.close
