Feature: User Sign Up

In order to view survey dashboard
As a new user
I want to sign up a account

Scenario: unsuccessful sign up
Given I am on "signup page"
When I fill "Username" with "invalid username"
And I fill "Email" with "invalid email"
And I fill "Password" with "password"
And I fill "Confirmation" with "verify password"
And I press "Sign Up"
Then I should see "Registration failed."

Scenario: successful sign up
Given I am on "signup page"
When I fill "Username" with "username"
And I fill "Email" with "example@example.com"
And I fill "Password" with "password"
And I fill "Confirmation" with "password"
And I press "Sign Up"
Then I should see "Registration successful."
