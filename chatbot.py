import openai
import mysql.connector

openai.api_key = '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'

#Establishing a connection to the MySQL database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="CSCI4400",
    database="mydb"
)
#Create a cursor object to allow database queries
cursor = conn.cursor()

def askBot(question):
    #Send user input to GPT-3 for context understanding
    response = openai.Completion.create(
        engine="text-davinci-003", 
        prompt=question,
        temperature=0.5,
        max_tokens=150
    )
    interpreted_input = response.choices[0].text.strip()
    return interpreted_input

def Recommendations(interpreted_input):
    #Calls askBot to interpret user input
    interpreted_input = askBot(interpreted_input)

    #Splits interpreted input into keywords
    keywords = interpreted_input.split()

    #Filters events based on keywords
    recommended_events = EventFilter(keywords)

    return recommended_events

def EventFilter(keywords):
    #mysql query to filter events by keywords
    query = "SELECT * FROM gen_events WHERE "
    conditions = []
    for keyword in keywords:
        conditions.append("Event_description LIKE %s")
    condition_string = " OR ".join(conditions)
    query += condition_string
    # Execute SQL query
    cursor.execute(query, ['%' + keyword + '%' for keyword in keywords])
    # Fetch filtered events
    recommended_events = cursor.fetchall()
    return recommended_events

cursor.close()
#Commits any changes to the database
conn.commit()
#Closes the connection to the database
conn.close()
