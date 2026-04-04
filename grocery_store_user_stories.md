# Grocery Store User Story

**US-01 — Create an account**
> *As a* new user,
> *I want to* create an account with my email and password,
> *so that* I can access the app's features.

**Acceptance Criteria:**
- The form includes: first name, last name, email, password, and password confirmation
- All fields are required
- A success message is displayed after a successful registration
- The user is redirected to the home page

---

**US-02 — Registration field validation**
> *As a* new user,
> *I want to* receive clear error messages if I fill out the form incorrectly,
> *so that* I can correct my information and complete my registration.

**Acceptance Criteria:**

| Error case | Expected message |
|---|---|
| Empty field | "This field is required." |
| Invalid email | "Please enter a valid email address." |
| Email already in use | "An account already exists with this email." |
| Password < 8 characters | "Password must be at least 8 characters long." |
| Passwords do not match | "Passwords do not match." |

---

**US-03 — Password strength**
> *As a* new user,
> *I want to* be guided on the strength of my password,
> *so that* I can create a secure account.

**Acceptance Criteria:**
- A visual indicator (weak / medium / strong) is displayed in real time
- The password must contain at least one uppercase letter, one number, and one special character to be considered "strong"
- A toggle button allows the user to show/hide the password

---

**US-04 — Log in to an account**
> *As a* registered user,
> *I want to* log in with my email and password,
> *so that* I can access my personal space and shopping lists.

**Acceptance Criteria:**
- The form includes: email and password
- On success, the user is redirected to their dashboard
- A "Stay logged in" option is available

---

**US-05 — Login error handling**
> *As a* user,
> *I want to* receive precise feedback when a login attempt fails,
> *so that* I can understand what went wrong and try again.

**Acceptance Criteria:**

| Error case | Expected message |
|---|---|
| Empty field | "Please fill in all fields." |
| Unrecognized email | "No account associated with this email." |
| Incorrect password | "Incorrect password. Please try again." |
| 5 failed attempts | "Account temporarily locked. Please try again in 15 minutes." |

---

**US-06 — Forgot password**
> *As a* user,
> *I want to* reset my password if I have forgotten it,
> *so that* I can regain access to my account.

**Acceptance Criteria:**
- A "Forgot your password?" link is visible on the login page
- The user receives an email with a reset link valid for 30 minutes
- If the email does not exist: "No account associated with this email."
- After a successful reset, the user is redirected to the login page

---

**US-07 — Logout**
> *As a* logged-in user,
> *I want to* be able to log out of the application,
> *so that* I can secure my account on a shared device.

**Acceptance Criteria:**
- A "Log out" button is accessible from the navigation menu
- The session is immediately invalidated
- The user is redirected to the login page

---

**US-08 — Store user data**
> *As a* user,
> *I want* my session data to be saved locally,
> *so that* my information persists between app sessions.

**Acceptance Criteria:**
- User details are stored in local storage upon successful login
- Data is cleared from local storage upon logout
- If "Stay logged in" is enabled, the session is restored on the next app launch
