describe('Home Page', () => {
  beforeEach(() => {
    // Visit the login page before each test
    cy.visit('/login');
    // cy.visit("/");
    cy.get('input[name="session[email]"]').type('x@x.com'); // Replace with your actual email
    cy.get('input[name="session[password]"]').type('123456'); // Replace with your actual password

    // Submit the login form
    cy.get('form').submit();

    // Verify that the login was successful
    cy.url().should('not.include', '/login');
  });

  xit("there is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  xit("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("navigates to a product-detail page", () => {
    cy.get(".products article:last-child a").click();
    // Verify that you are on the product detail page
    cy.url().should("include", "/products/");
  });
});