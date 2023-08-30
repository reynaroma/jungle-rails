describe('Home Page', () => {
  beforeEach(() => {
    // Visit the login page before each test
    cy.visit('/login');
    // login first
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

  xit("navigates to a product-detail page", () => {
    cy.get(".products article:first-child a").click();
    // Verify that you are on the product detail page
    cy.url().should("include", "/products/");
  });

  it("adds a product to the cart", () => {
    // click the first product if it's available
    cy.get(".products article:first-child a").click();
    // click the add to cart button
    cy.get(".price button").click()
    cy.get(".price button").click()
    cy.get(".price button").click()

    // click the cart link
    cy.get(".nav-link[href='/cart']").click()
  
    // confirm that when I pressed thrice, the cart has 3 items
    cy.get('.table-bordered tbody tr:first-child td:eq(3) div').invoke('text').as('quantityText').then(quantityText => {
      // Extract the number from the text using a regular expression
      const quantity = parseInt(quantityText.match(/\d+/)[0]);

      // Assert that the displayed quantity matches the expected quantity
      expect(quantity).to.eq(3); // Change this to the expected quantity
    });
  });
});