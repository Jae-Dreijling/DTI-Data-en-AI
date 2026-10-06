import java.util.Scanner;

public class App {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        boolean running = true;

        System.out.println("=================================");
        System.out.println("       AI HUISDIER GENERATOR");
        System.out.println("=================================");
        System.out.println();

        while (running) {

            // =========================
            // KEUZES VAN DE GEBRUIKER
            // =========================

            int animalType;
            int livingSpace;
            int personality;

            System.out.println("1. Welk soort dier spreekt je aan?");
            System.out.println();
            System.out.println("1 - Zoogdier");
            System.out.println("2 - Vogel");
            System.out.println("3 - Vis");
            System.out.println("4 - Maakt mij niet uit");
            System.out.println();

            System.out.print("Maak een keuze: ");
            animalType = scanner.nextInt();

            System.out.println();


            // =========================
            // OPTIE 2: LEEFRUIMTE
            // =========================

            System.out.println("2. Hoeveel leefruimte heb je?");
            System.out.println();
            System.out.println("1 - Klein appartement");
            System.out.println("2 - Gemiddelde woning");
            System.out.println("3 - Groot huis / tuin");
            System.out.println();

            System.out.print("Maak een keuze: ");
            livingSpace = scanner.nextInt();

            System.out.println();


            // =========================
            // OPTIE 3: PERSOONLIJKHEID
            // =========================

            System.out.println("3. Welke persoonlijkheid zoek je?");
            System.out.println();
            System.out.println("1 - Rustig");
            System.out.println("2 - Speels");
            System.out.println("3 - Sociaal");
            System.out.println("4 - Maakt mij niet uit");
            System.out.println();

            System.out.print("Maak een keuze: ");
            personality = scanner.nextInt();

            System.out.println();


            // =========================
            // AI RESULTAAT
            // =========================

            System.out.println("AI denkt na...");
            System.out.println();

            String pet = generatePet(
                    animalType,
                    livingSpace,
                    personality
            );

            String petName = generateName(pet);


            // =========================
            // RESULTAAT
            // =========================

            System.out.println("=================================");
            System.out.println("       JOUW AI HUISDIER");
            System.out.println("=================================");
            System.out.println();

            System.out.println(generateAsciiArt(pet));
            System.out.println();

            System.out.println("Naam: " + petName);
            System.out.println("Dier: " + pet);
            System.out.println();

            System.out.println("AI BESCHRIJVING");
            System.out.println("-------------------------");

            System.out.println(generatePetDescription(
                    pet,
                    livingSpace,
                    personality
            ));

            System.out.println();

            System.out.println("WAAROM DIT DIER?");
            System.out.println("-------------------------");

            System.out.println(generateReason(pet));

            System.out.println();
            System.out.println("=================================");


            // =========================
            // OPNIEUW OF STOPPEN?
            // =========================

            int choice = askAgain(scanner);

            if (choice == 0) {

                running = false;

            } else if (choice == 2) {

                // Maak willekeurige keuzes

                animalType = randomNumber(1, 4);
                livingSpace = randomNumber(1, 3);
                personality = randomNumber(1, 4);

                System.out.println();
                System.out.println("=================================");
                System.out.println("       VERRASSINGSHUISDIER");
                System.out.println("=================================");
                System.out.println();

                System.out.println("De AI kiest alles voor jou...");
                System.out.println();

                String randomPet = generatePet(
                        animalType,
                        livingSpace,
                        personality
                );

                String randomName = generateName(randomPet);

                System.out.println(generateAsciiArt(randomPet));
                System.out.println();

                System.out.println("Jouw fantastisch nieuwe huisdier heet natuurlijk: " + petName);
                System.out.println("Dier: " + randomPet);
                System.out.println();

                System.out.println("AI BESCHRIJVING");
                System.out.println("-------------------------");

                System.out.println(generatePetDescription(
                        randomPet,
                        livingSpace,
                        personality
                ));

                System.out.println();

                System.out.println("WAAROM DIT DIER?");
                System.out.println("-------------------------");

                System.out.println(generateReason(randomPet));

                System.out.println();
                System.out.println("=================================");
            }
        }

        System.out.println();
        System.out.println("Bedankt voor het gebruiken van");
        System.out.println("de AI Huisdier Generator!");

        scanner.close();
    }


    // ==========================================
    // HUISDIER GENEREREN
    // ==========================================

    private static String generatePet(
            int animalType,
            int livingSpace,
            int personality) {

        switch (animalType) {

            // =========================
            // ZOOGDIER
            // =========================

            case 1:

                if (livingSpace == 1) {

                    switch (personality) {

                        case 1:
                            return "Hamster";

                        case 2:
                            return "Cavia";

                        case 3:
                            return "Rat";

                        case 4:
                            return "Hamster";
                    }
                }

                if (livingSpace == 2) {

                    switch (personality) {

                        case 1:
                            return "Konijn";

                        case 2:
                            return "Kat";

                        case 3:
                            return "Kat";

                        case 4:
                            return "Konijn";
                    }
                }

                if (livingSpace == 3) {

                    switch (personality) {

                        case 1:
                            return "Konijn";

                        case 2:
                            return "Hond";

                        case 3:
                            return "Hond";

                        case 4:
                            return "Kat";
                    }
                }

                break;


            // =========================
            // VOGEL
            // =========================

            case 2:

                switch (personality) {

                    case 1:
                        return "Kanarie";

                    case 2:
                        return "Parkiet";

                    case 3:
                        return "Papegaai";

                    case 4:
                        return "Parkiet";
                }

                break;


            // =========================
            // VIS
            // =========================

            case 3:

                if (personality == 1) {
                    return "Betta vis";
                }

                if (personality == 2) {
                    return "Guppy";
                }

                if (personality == 3) {
                    return "Goudvis";
                }

                return "Guppy";


            // =========================
            // MAAKT NIET UIT
            // =========================

            case 4:

                if (livingSpace == 1) {

                    if (personality == 1) {
                        return "Hamster";
                    }

                    if (personality == 2) {
                        return "Cavia";
                    }

                    return "Kat";
                }

                if (livingSpace == 2) {

                    if (personality == 1) {
                        return "Konijn";
                    }

                    if (personality == 2) {
                        return "Kat";
                    }

                    return "Hond";
                }

                if (livingSpace == 3) {
                    return "Hond";
                }

                break;
        }

        return "Cavia";
    }


    // ==========================================
// NAAM GENEREREN
// ==========================================

    private static String generateName(String pet) {

        String[] names;

        switch (pet) {

            case "Hamster":
                names = new String[]{
                        "Nootje", "Pip", "Pukkie", "Muffin", "Knabbel",
                        "Ollie", "Teddy", "Mochi", "Pixel", "Binkie",
                        "Coco", "Milo", "Bo", "Sam", "Kiwi",
                        "Dotje", "Snuf", "Peanut", "Bobbie", "Pluis"
                };
                break;

            case "Cavia":
                names = new String[]{
                        "Bella", "Daisy", "Pippa", "Luna", "Rosie",
                        "Coco", "Nala", "Molly", "Ollie", "Charlie",
                        "Bo", "Pip", "Teddy", "Snoet", "Muffin",
                        "Fluffy", "Toffee", "Bambi", "Pebbles", "Gijs"
                };
                break;

            case "Rat":
                names = new String[]{
                        "Remy", "Pixel", "Milo", "Loki", "Ziggy",
                        "Pip", "Nova", "Ollie", "Storm", "Ravi",
                        "Dexter", "Gizmo", "Toby", "Sam", "Bean",
                        "Mochi", "Boris", "Finn", "Max", "Nox"
                };
                break;

            case "Konijn":
                names = new String[]{
                        "Snowy", "Flappie", "Coco", "Luna", "Hazel",
                        "Poppy", "Nala", "Bella", "Milo", "Ollie",
                        "Teddy", "Pip", "Mochi", "Daisy", "Bun",
                        "Willow", "Toffee", "Binky", "Clover", "Rosie"
                };
                break;

            case "Kat":
                names = new String[]{
                        "Luna", "Simba", "Milo", "Nala", "Loki",
                        "Oliver", "Leo", "Bella", "Max", "Coco",
                        "Misty", "Nova", "Pixel", "Shadow", "Mimi",
                        "Ollie", "Felix", "Salem", "Toby", "Willow"
                };
                break;

            case "Hond":
                names = new String[]{
                        "Max", "Bella", "Charlie", "Luna", "Cooper",
                        "Milo", "Rocky", "Bailey", "Buddy", "Ollie",
                        "Teddy", "Bo", "Loki", "Daisy", "Finn",
                        "Bruno", "Nova", "Toby", "Rex", "Ziggy"
                };
                break;

            case "Kanarie":
                names = new String[]{
                        "Sunny", "Tweety", "Pico", "Pip", "Goldie",
                        "Kiwi", "Coco", "Charlie", "Rio", "Sky",
                        "Billie", "Mango", "Lemon", "Tweet", "Ollie",
                        "Peep", "Sol", "Nino", "Pippo", "Sunny"
                };
                break;

            case "Parkiet":
                names = new String[]{
                        "Kiwi", "Rio", "Pico", "Sky", "Blue",
                        "Sunny", "Charlie", "Pip", "Coco", "Mango",
                        "Ollie", "Billy", "Milo", "Tweet", "Echo",
                        "Pixel", "Joey", "Finn", "Ziggy", "Puck"
                };
                break;

            case "Papegaai":
                names = new String[]{
                        "Paco", "Rio", "Kiki", "Coco", "Mango",
                        "Kiwi", "Charlie", "Lola", "Oscar", "Sammy",
                        "Sunny", "Echo", "Pedro", "Pablo", "Ziggy",
                        "Max", "Milo", "Pico", "Nala", "Ruby"
                };
                break;

            case "Betta vis":
                names = new String[]{
                        "Bubbles", "Aqua", "Nemo", "Blue", "Coral",
                        "Finn", "Splash", "Pearl", "Wave", "Reef",
                        "Bloop", "Dory", "Misty", "Tide", "Ocean",
                        "Pixel", "Ruby", "Sunny", "Neptune", "Marlin"
                };
                break;

            case "Guppy":
                names = new String[]{
                        "Bubbles", "Finn", "Nemo", "Splash", "Aqua",
                        "Dory", "Pixel", "Blue", "Sunny", "Coral",
                        "Reef", "Wave", "Pip", "Tiny", "Spark",
                        "Flash", "Dot", "Goldie", "Pebble", "Blub"
                };
                break;

            case "Goudvis":
                names = new String[]{
                        "Goldie", "Bubbles", "Nemo", "Sunny", "Oscar",
                        "Finn", "Amber", "Gold", "Splash", "Dory",
                        "Pearl", "Orange", "Charlie", "Aqua", "Pumpkin",
                        "Ruby", "Spark", "Marlin", "Coral", "Blub"
                };
                break;

            default:
                names = new String[]{
                        "Buddy", "Milo", "Luna", "Charlie", "Pip",
                        "Coco", "Max", "Nova", "Ollie", "Sam"
                };
        }

        // Kies willekeurig een naam
        int randomIndex = (int) (Math.random() * names.length);

        return names[randomIndex];
    }

    // ==========================================
    // "AI"-PERSOONLIJKE BESCHRIJVING
    // ==========================================

    private static String generatePetDescription(
            String pet,
            int livingSpace,
            int personality) {

        String ruimte = "";
        String karakter = "";

        // =========================
        // RUIMTE
        // =========================

        switch (livingSpace) {

            case 1:
                ruimte = "Je woont wat kleiner, dus jouw huisdier "
                        + "is gewend aan een compacte leefomgeving.";
                break;

            case 2:
                ruimte = "Je hebt een gemiddelde woning waarin "
                        + "jouw huisdier genoeg ruimte heeft om "
                        + "op ontdekkingstocht te gaan.";
                break;

            case 3:
                ruimte = "Je hebt veel ruimte en misschien zelfs "
                        + "een tuin. Jouw huisdier kan daardoor "
                        + "lekker bewegen en op avontuur gaan.";
                break;
        }


        // =========================
        // PERSOONLIJKHEID
        // =========================

        switch (personality) {

            case 1:
                karakter = "Het is een rustig dier dat graag "
                        + "op zijn eigen tempo de wereld ontdekt.";
                break;

            case 2:
                karakter = "Het is een speels dier dat graag "
                        + "rondrent, speelt en nieuwe dingen ontdekt.";
                break;

            case 3:
                karakter = "Het is een sociaal dier dat graag "
                        + "tijd met jou en andere dieren doorbrengt.";
                break;

            case 4:
                karakter = "Het heeft een gebalanceerd karakter "
                        + "met zowel rustige als actieve momenten.";
                break;
        }


        // =========================
        // DIER-SPECIFIEKE TEKST
        // =========================

        switch (pet) {

            case "Hamster":
                return "Ik stel me jouw hamster voor als een klein "
                        + "nieuwsgierig diertje dat 's avonds wakker "
                        + "wordt en meteen zijn omgeving begint te "
                        + "verkennen. " + ruimte + " " + karakter;

            case "Cavia":
                return "Ik zie jouw cavia al voor me: rustig rondlopend, "
                        + "op zoek naar eten en enthousiast piepend zodra "
                        + "hij je hoort binnenkomen. " + ruimte + " "
                        + karakter;

            case "Rat":
                return "Jouw rat zou waarschijnlijk de nieuwsgierige "
                        + "ontdekker van het huis zijn. Hij onderzoekt "
                        + "alles wat nieuw is en zoekt graag interactie "
                        + "met jou. " + ruimte + " " + karakter;

            case "Konijn":
                return "Ik stel me jouw konijn voor terwijl het door "
                        + "de kamer huppelt en af en toe nieuwsgierig "
                        + "naar je toe komt. " + ruimte + " " + karakter;

            case "Kat":
                return "Jouw kat zou waarschijnlijk een eigenwijze "
                        + "maar nieuwsgierige huisgenoot worden. Soms "
                        + "ligt hij rustig te slapen en een moment later "
                        + "rent hij plotseling door het huis. "
                        + ruimte + " " + karakter;

            case "Hond":
                return "Ik zie jouw hond al voor me: enthousiast bij "
                        + "de deur wanneer je thuiskomt en altijd klaar "
                        + "voor een nieuw avontuur. " + ruimte + " "
                        + karakter;

            case "Kanarie":
                return "Jouw kanarie zou een klein, levendig karakter "
                        + "hebben en waarschijnlijk regelmatig de kamer "
                        + "vullen met vrolijk gezang. " + ruimte + " "
                        + karakter;

            case "Parkiet":
                return "Ik stel me jouw parkiet voor als een nieuwsgierig "
                        + "klein vogeltje dat graag geluid maakt en alles "
                        + "in zijn omgeving onderzoekt. " + ruimte + " "
                        + karakter;

            case "Papegaai":
                return "Jouw papegaai zou waarschijnlijk een echte "
                        + "persoonlijkheid zijn. Hij leert geluiden kennen, "
                        + "zoekt interactie en wil overal bij betrokken "
                        + "zijn. " + ruimte + " " + karakter;

            case "Betta vis":
                return "Ik zie jouw betta rustig door het aquarium "
                        + "zwemmen, waarbij hij nieuwsgierig reageert "
                        + "op bewegingen buiten het glas. " + ruimte + " "
                        + karakter;

            case "Guppy":
                return "Jouw guppy zou constant in beweging zijn en "
                        + "door het aquarium schieten alsof hij altijd "
                        + "iets nieuws aan het ontdekken is. "
                        + ruimte + " " + karakter;

            case "Goudvis":
                return "Ik stel me jouw goudvis voor als een rustig "
                        + "visje dat nieuwsgierig door zijn aquarium "
                        + "zwemt en langzaam zijn omgeving verkent. "
                        + ruimte + " " + karakter;

            default:
                return "Dit huisdier heeft een unieke persoonlijkheid "
                        + "die goed aansluit bij jouw voorkeuren.";
        }
    }


    private static int randomNumber(int min, int max) {

        return (int) (Math.random() * (max - min + 1)) + min;
    }

    // ==========================================
    // ASCII ART
    // ==========================================


    private static String generateAsciiArt(String pet) {

        switch (pet) {

            case "Hamster":
                return
                        "   .-\"\"\"-.   \n" +
                                "  /       \\  \n" +
                                " |  o   o  | \n" +
                                " |    ^    | \n" +
                                " |  \\___/  | \n" +
                                "  \\       /  \n" +
                                "   '-._.-'   ";

            case "Cavia":
                return
                        "  __________  \n" +
                                " /          \\ \n" +
                                "|  o      o  |\n" +
                                "|     __     |\n" +
                                "|   \\____/   |\n" +
                                " \\__________/ ";

            case "Rat":
                return
                        "       __..--''``---....___   \n" +
                                "   _.-'                   `-._\n" +
                                " .'                           `.\n" +
                                "/   .-\"-.             .-\"-.     \\\n" +
                                "|  /     \\           /     \\    |\n" +
                                "| |  o o  |         |  o o  |   |\n" +
                                "|  \\  ^  /           \\  ^  /    |\n" +
                                " \\  '---'             '---'    /\n" +
                                "  `._                     _.-'\n" +
                                "     `--..___________..--'";

            case "Konijn":
                return
                        "   /\\   /\\  \n" +
                                "  /  \\_/  \\ \n" +
                                " |  o   o  |\n" +
                                " |    ^    |\n" +
                                " |  \\___/  |\n" +
                                "  \\_______/ ";

            case "Kat":
                return
                        " /\\_/\\\\\n" +
                                "( o.o )\n" +
                                " > ^ <";

            case "Hond":
                return
                        " / \\__\n" +
                                "(    @\\___\n" +
                                " /         O\n" +
                                "/   (_____/\n" +
                                "/_____/   U";

            case "Kanarie":
                return
                        "     __\n" +
                                "   _(  )_\n" +
                                "  /  o   \\\n" +
                                " <    ^   >\n" +
                                "  \\  ___ /\n" +
                                "   `-----'";

            case "Parkiet":
                return
                        "      .-.\n" +
                                "     /   \\\n" +
                                "    | o o |\n" +
                                "    |  ^  |\n" +
                                "   /| '-' |\\\n" +
                                "  /_|     |_\\\n" +
                                "    /_____\\ ";

            case "Papegaai":
                return
                        "      .-\"\"-.\n" +
                                "     /  o o \\\n" +
                                "    |    ^   |\n" +
                                "    |  \\___/ |\n" +
                                "     \\       /\n" +
                                "      |_____|\n" +
                                "       /   \\";

            case "Betta vis":
                return
                        "       /`·.¸\n" +
                                "      /¸...¸`:·\n" +
                                "  ¸.·´  ¸   `·.¸.·´)\n" +
                                " : © ):´;      ¸  {\n" +
                                "  `·.¸ `·  ¸.·´\\`·¸)\n" +
                                "      `\\´´\\¸.·´";

            case "Guppy":
                return
                        "      /\\\n" +
                                "  ___/  \\___\n" +
                                " <    o  o  )====<\n" +
                                "  ‾‾‾\\____/‾‾‾\n" +
                                "      \\/";

            case "Goudvis":
                return
                        "       _.-=\"\"=-._\n" +
                                "    .-'  .--.    `-.\n" +
                                "   /    /    \\      \\\n" +
                                "  |    |  o   |      |\n" +
                                "   \\    \\____/      /\n" +
                                "    `-.          .-'\n" +
                                "       `--.____.--'";

            default:
                return "(geen afbeelding beschikbaar)";
        }
    }


    // ==========================================
    // REDEN VOOR HET ADVIES
    // ==========================================

    private static String generateReason(String pet) {

        switch (pet) {

            case "Hamster":
                return "Een hamster is klein, relatief rustig en heeft "
                        + "weinig leefruimte nodig. Dit maakt hem geschikt "
                        + "voor een kleinere woning.";

            case "Cavia":
                return "Een cavia is een sociaal en vriendelijk huisdier "
                        + "dat relatief klein is en graag gezelschap heeft.";

            case "Rat":
                return "Ratten zijn intelligente en sociale dieren. "
                        + "Ze zijn klein, maar kunnen erg speels en "
                        + "interactief zijn.";

            case "Konijn":
                return "Een konijn is een rustig en sociaal huisdier. "
                        + "Met voldoende ruimte kan het een goede "
                        + "huisgenoot zijn.";

            case "Kat":
                return "Een kat is relatief zelfstandig, maar kan ook "
                        + "erg sociaal en speels zijn. Daardoor past een "
                        + "kat bij veel verschillende leefstijlen.";

            case "Hond":
                return "Een hond is sociaal, actief en speels. "
                        + "Een hond past vooral bij iemand die voldoende "
                        + "ruimte en tijd heeft.";

            case "Kanarie":
                return "Een kanarie is een relatief rustig huisdier "
                        + "dat weinig ruimte nodig heeft.";

            case "Parkiet":
                return "Een parkiet is klein, sociaal en speels. "
                        + "Hij kan daardoor goed passen bij iemand die "
                        + "een interactief vogelhuisdier zoekt.";

            case "Papegaai":
                return "Een papegaai is zeer intelligent en sociaal. "
                        + "Hij heeft wel veel aandacht en ruimte nodig.";

            case "Betta vis":
                return "Een betta vis is klein en interessant om naar "
                        + "te kijken. Hij neemt relatief weinig ruimte in.";

            case "Guppy":
                return "Guppy's zijn kleine, actieve vissen die leuk "
                        + "zijn om in een aquarium te houden.";

            case "Goudvis":
                return "Een goudvis is een bekend en rustig huisdier "
                        + "dat goed past bij iemand die een aquarium wil.";

            default:
                return "Dit huisdier past goed bij de gekozen voorkeuren.";
        }
    }
    private static int askAgain(Scanner scanner) {

        System.out.println();
        System.out.println("=================================");
        System.out.println(" WIL JE NOG EEN HUISDIER MAKEN?");
        System.out.println("=================================");
        System.out.println();

        System.out.println("1 - Opnieuw kiezen");
        System.out.println("2 - Verrassingshuisdier");
        System.out.println("0 - Stoppen");
        System.out.println();

        System.out.print("Maak een keuze: ");

        return scanner.nextInt();
    }
}
