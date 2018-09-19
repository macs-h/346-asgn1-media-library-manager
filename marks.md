# Repository: smax

|           |              |
|-----------|--------------|
| Raw       | 17.0/20   |
| Bonus     | 3/3  |
| Total     | 20/20 |


## Design			
								
| Assignment of Responsibilities | Cohesion | Coupling | Inheritance | Composition |	
|--------------------------------|----------|----------|-------------|-------------|
| 5 / 5       | 5 / 5 | 5 / 5 | 4 / 5 | 5 / 5 |


## Implementation
		
| Visibility                     | Additional protocols | Comments          |
|--------------------------------|----------------------|-------------------|
| 3 / 5             | 0 / 5    | 8 / 10 |

## Functionality				
| Import         | Export            | Search         | Edit         |
|----------------|-------------------|----------------|--------------|
| 3 / 5 | 5 / 5    | 5 / 5 | 5 / 5 |	

## Misc

| Quality        | Idiomatic Swift   | JSON data matches spec | Git commit log |
|----------------|-------------------|------------------------|----------------|
| 5 /5 | 4 /5  | 1 /1            | 2 /2     |
			

## Design Patterns	

| Appropriate            |
|------------------------|
| 3 /5 |	

## Testing	

| Thoroughness        |
|---------------------|
| 5 /5 |	

## Report
| Design        | Testing        | Role          | Spelling/Grammar/etc. errors |
|---------------|----------------|---------------|------------------------------|
| 4 /4 | 4 /4 | 4 /4 | 0               | 


## My Comments

You shouldn’t lower case the file paths when loading data. When testing the remove you shouldn’t need to prompt the user to input yes or no. Which is correct? Which is going to pass the tests you’ve got?

Out of interest, do you know about the coverage tools as part of Xcode? You can enable it for the unit tests and get a measure of how thorough your tests are and how much of your code base is being tested.