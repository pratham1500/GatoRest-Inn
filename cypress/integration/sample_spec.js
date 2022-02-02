describe('My First Test', () => {
    it('Opens up the website', () => {
      cy.visit('localhost:4200')
      cy.contains('Learn Angular')
    })
  })
