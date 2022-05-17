# Phase 3 Final Project: Budget Tracker

** Basic API with Sinatra and Active Record to support a React frontend

Budget Tracker is a web app that allows you to add a new monthly budget limit.  You can also add how much you spend during any budget month in the form of individual itemized transactions.

Only one Budget can be added per month, but a month and budget can have many different transactions related to it.  You can view your budget summary for the month by going to the My Dashboard section to see how much you've spent (Total Sum of all of your month's transactions) and how much you have left for the month depending on your budget.

## Link to Front-end Repository
https://github.com/katherineyuneman/final-project-phase3-budget-tracker


## Installation
In the project directory, install all of the node modules used in this Ruby app:

`bundle install`

## Starting Server

In the project directory, you can start your server with:

`bundle exec rake server`

This will run your server on port
[http://localhost:9292](http://localhost:9292).

The page will reload when you make changes.

## Example Endpoints:

All budgets
`/budgets`

All transactions
`/transactions`

Individual Month's Budget by Month Description
`/budgetsummary/May`

Individual Budget by Budget ID
`/budgets/14`

Sum of Individual Budget Month's Transactions
`/budgets/14/May/transactions/sum`

Last 5 Transactions Created
`/transactions`



## Contributing
Pull requests are welcome.