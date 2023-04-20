# Crowdsale

### Joint Savings Account automates the creation of joint savings accounts. It is a Solidity smart contract that accepts two user addresses. These addresses control a joint savings account. Joint Savings Account Smart Contract uses ether management functions to implement a financial institution’s requirements for providing the the joint savings account specific features. These features consist of the ability to deposit and withdraw funds from the account.

---

![crypto](Images/cr.png)

---

## Table of contents

1. [Technologies](#technologies)
2. [Usage](#usage)
3. [Contributors](#contributors)
4. [License](#license)

---

## Technologies

`Solidity`

_Other Software_

1. We use the `Remix IDE` to build and test the Joint Savings Account Smart Contract created with `Solidity`. Because we use the web version of this IDE, we don’t need to install any software for this module.

   - [Remix IDE](https://remix.ethereum.org/) - to initate the application.

---

## Usage

> Application summary<br/>

The application consists of the following three sections:<br/>

- Creating a JointSavings smart contract in Solidity:<br/>

  - A set of variables defined inside the contract.<br/>
  - The following functions are included:

    1.  Withdraw function;
    2.  Deposit function;
    3.  SetAccounts function;
    4.  A Fallback function to ensure the contract can store ether that’s sent from outside the deposit function.<br/>

- Compiling and Deploying the Contract:<br/>

  - Once the smart contract is written, we compile it and make sure there are no errors that occur in our code (the success is confirmed by the green check sign):<br/>
    ![compile](Execution_Results/compiled.JPG)<br/>
  - We choose the virtual environment and click the Deploy button to deploy our smart contract, and then confirm that it is successfully deployed:<br/>
    ![compile](Execution_Results/deployed.JPG)<br/>

- Interacting with the Deployed Smart Contract:<br/>

  - After deploying the contract the following functionalities were tested:<br/>

    1. The setAccounts function used to define the authorized Ethereum address that will be able to withdraw funds from the contract:
       ![setAccounts](Execution_Results/setAccounts.JPG)<br/>

    2. The deposit functionality of the smart contract was tested by sending<br/>
       a) 1 ether as wei:<br/>
       ![1ETH](Execution_Results/1ETH.JPG)<br/>
       b) 10 ether as wei:<br/>
       ![10ETH](Execution_Results/10ETH.JPG)<br/>
       c) 5 ether:<br/>
       ![5ETH](Execution_Results/5ETH.JPG)<br/>

    3. The withdrawl functionality of the smart contract was tested by withdrawing<br/>
       a) 5 ether from accountOne:<br/>
       ![5ETHW](Execution_Results/withdr1.JPG)<br/>
       b) 10 ether from accountTwo:<br/>
       ![10ETHW](Execution_Results/withdr2.JPG)<br/>
       NOTE: After each transaction, the contractBalance function was used to verify that the funds were withdrawn from the contract. Also, the lastToWithdraw and lastWithdrawAmount functions were used to verify that the address and amount were correct. Those checks can be seen on the above screenshots too.

> Getting started<br/>

- To deploy Joint Savings Account Smart Contract first clone the repository to your PC to obtain the joint_savings Solidity file containing the contract.<br/>
- To deploy the contract open the cloned joint_savings.sol file in the Remix IDE and follow the instructions from the [Usage](#usage) section. <br/>

---

## Contributors

Contact Details:

Boris Dudkin:

- [Email](boris.dudkin@gmail.com)
- [LinkedIn](www.linkedin.com/in/Boris-Dudkin)

---

## License

MIT

---
