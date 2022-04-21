/// <reference types="cypress" />
describe('example to-do app', () => {
  it('loads home page', () => {
    cy.visit('http://localhost:8080/#/')
  })
})
