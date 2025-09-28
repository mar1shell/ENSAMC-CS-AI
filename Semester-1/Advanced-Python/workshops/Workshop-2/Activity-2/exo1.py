def format_usernames(usernames):
    formatted = []
    for name in usernames:
        name = name.lower().replace(' ', '_')
        if not name.startswith('user_'):
            name = 'user_' + name
        formatted.append(name)
    return formatted

# Exemple d'utilisation
if __name__ == "__main__":
    noms = ["John Doe", "user_alice", "BOB SMITH"]
    print(format_usernames(noms))