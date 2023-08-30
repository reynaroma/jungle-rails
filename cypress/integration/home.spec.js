// home.spec.js created with Cypress
//
// Start writing your Cypress tests below!
// If you're unfamiliar with how Cypress works,
// check out the link below and learn how to write your first test:
// https://on.cypress.io/writing-first-test


// Write a basic test to visit the homepage of our Jungle App

describe('Home Page', () => {
  beforeEach(() => {
    // Visit the login page before each test
    cy.visit('/login');
  });

  it("there is products on the page", () => {
    cy.visit("/");
    cy.get('input[name="session[email]"]').type('x@x.com'); // Replace with your actual email
    cy.get('input[name="session[password]"]').type('123456'); // Replace with your actual password

    // Submit the login form
    cy.get('form').submit();

    // Verify that the login was successful
    cy.url().should('not.include', '/login');
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.visit("/");
    cy.get('input[name="session[email]"]').type('x@x.com'); // Replace with your actual email
    cy.get('input[name="session[password]"]').type('123456'); // Replace with your actual password

    // Submit the login form
    cy.get('form').submit();

    // Verify that the login was successful
    cy.url().should('not.include', '/login');
    cy.get(".products article").should("be.visible");
    cy.get(".products article").should("have.length", 4);
  });
});

