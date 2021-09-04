# Bank Kata
## Instructions
Write a class named Account that implements the following public interface:

``` csharp
public interface AccountService
{
    void deposit(int amount);
    void withdraw(int amount); 
    void printStatement();
}
```
## Rules
You cannot change the public interface of this class.
## Desired Behaviour
Here's the specification for an acceptance test that expresses the desired behaviour for this

- [x] _**Given** a client makes a **deposit** of **1000** on **10-01-2012**_
- [x] _**And** a **deposit** of **2000** on **13-01-2012**_
- [x] _**And** a **withdrawal** of **500** on **14-01-2012**_
- [x] _**When** they **print** their bank statement_
### _**Then** they would see:_
```
Date       || Amount || Balance
14/01/2012 || -500   || 2500
13/01/2012 || 2000   || 3000
10/01/2012 || 1000   || 1000
```

* We're using `ints` for the money amounts to keep the auxiliaries as simple as possible.
* Don't worry about spacing and indentation in the statement output. (You could instruct your acceptance test to ignore whitespace if you wanted to.)
* Use the acceptance test to guide your progress towards the solution. 
* When in doubt, go for the simplest solution!
