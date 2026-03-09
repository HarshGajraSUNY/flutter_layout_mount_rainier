# Flutter Layout Demo

This project implements a Flutter layout demo for a travel destination (Mount Rainier) using a modular, component-based approach.

The UI is built by composing several custom stateless widgets into a single `Column`.

## Core Components

- `ImageSection`: Dynamically loads an asset image. It converts the provided name (for example, `Rainier`) into a lowercase, underscored filename path (`rainier.jpg`).
- `TitleSection`: Displays the destination name in bold and the location in muted grey. It includes a rating indicator with a red star icon and the number `41`.
- `ButtonSection`: A row of interactive icons (`Call`, `Route`, and `Share`). Each button is built using a helper method, `_buildButtonColumn`, to keep styling and spacing consistent.
- `TextSection`: Handles the long-form description of the volcano, applying 32 pixels of padding so text remains readable and aligned with the rest of the layout.

## Technical Highlights

- **Modular design**: Each UI section is encapsulated in its own class, making the code reusable and easier to maintain.
- **Layout widgets**: Uses `Row`, `Column`, `Padding`, and `Expanded` to create a responsive, structured mobile interface.
- **Theming**: Uses `Theme.of(context).primaryColor` for the button section to keep app branding consistent.
