module example::Notes {
    use std::signer;
    use std::string;
    use std::vector;
    use std::option;

    struct Note has key, store {
        id: u64,
        title: string::String,
        content: string::String,
        tags: vector<string::String>,
        created_at: u64,
        updated_at: u64,
    }

    struct UserNotes has key, store {
        notes: vector<Note>,
        next_id: u64,
    }

    public entry fun initialize(account: &signer) {
        move_to(account, UserNotes { notes: vector::empty<Note>(), next_id: 1 });
    }

    public entry fun create_note(account: &signer, title: string::String, content: string::String, tags: vector<string::String>, timestamp: u64) acquires UserNotes {
        let user_notes = borrow_global_mut<UserNotes>(signer::address_of(account));
        let note = Note {
            id: user_notes.next_id,
            title,
            content,
            tags,
            created_at: timestamp,
            updated_at: timestamp,
        };
        vector::push_back(&mut user_notes.notes, note);
        user_notes.next_id = user_notes.next_id + 1;
    }

    public entry fun update_note(account: &signer, note_id: u64, title: option::Option<string::String>, content: option::Option<string::String>, tags: option::Option<vector<string::String>>, timestamp: u64) acquires UserNotes {
        let user_notes = borrow_global_mut<UserNotes>(signer::address_of(account));
        let len = vector::length(&user_notes.notes);
        let mut i = 0;
        while (i < len) {
            let note_ref = &mut vector::borrow_mut(&mut user_notes.notes, i);
            if (note_ref.id == note_id) {
                if (option::is_some(&title)) {
                    note_ref.title = option::extract(title);
                }
                if (option::is_some(&content)) {
                    note_ref.content = option::extract(content);
                }
                if (option::is_some(&tags)) {
                    note_ref.tags = option::extract(tags);
                }
                note_ref.updated_at = timestamp;
                return;
            }
            i = i + 1;
        }
        // If not found, do nothing (or you can abort)
    }

    public fun get_note(account: address, note_id: u64): option::Option<Note> acquires UserNotes {
        let user_notes = borrow_global<UserNotes>(account);
        let len = vector::length(&user_notes.notes);
        let mut i = 0;
        while (i < len) {
            let note_ref = &vector::borrow(&user_notes.notes, i);
            if (note_ref.id == note_id) {
                return option::some(*note_ref);
            }
            i = i + 1;
        }
        option::none<Note>()
    }

    public fun list_notes(account: address): vector<Note> acquires UserNotes {
        let user_notes = borrow_global<UserNotes>(account);
        user_notes.notes
    }
}