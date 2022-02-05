describe('Basic Test', () => {
  it('Opens up the website', () => {
    cy.visit('localhost:4200')
    cy.contains('The GatoRest Inn')
  }),
  it('Goes to Contact Us page', () => {
    cy.contains('Contact Us').click()
    cy.contains('Name')
  })
  it('Scrolls to Footer', () => {
    cy.scrollTo('bottom')
  })
})