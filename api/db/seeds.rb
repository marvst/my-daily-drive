[
    {
        # external_id: "b2837be6-2e14-4d70-b338-713d417432e3",
        email: "marcosvst98@gmail.com",
        encoded_refresh_token: "YjI4MzdiZTYtMmUxNC00ZDcwLWIzMzgtNzEzZDQxNzQzMmUz",
        active: true,
        settings: [
            {
                key: "tracks_preference",
                value: "top_tracks",
                active: true
            },
            {
                key: "shows_preference",
                value: "123,456,789",
                active: true
            },
            {
                key: "tracks_preference",
                value: "saved_tracks",
                active: false
            }
        ]
    },
    {
        # external_id: "e3e4a4ca-0399-4785-a93f-1b97c34794f4",
        email: "marcosvst98+mdd+1@gmail.com",
        encoded_refresh_token: "ZTNlNGE0Y2EtMDM5OS00Nzg1LWE5M2YtMWI5N2MzNDc5NGY0",
        active: true,
        settings: [
            {
                key: "tracks_preference",
                value: "saved_tracks",
                active: true
            },
            {
                key: "shows_preference",
                value: "456,123,890",
                active: true
            }
        ]
    }
].each do |user|
    new_user = User.find_or_create_by!(
        # external_id: user[:external_id],
        email: user[:email],
        encoded_refresh_token: user[:encoded_refresh_token],
        active: user[:active]
    )

    user[:settings].each do |setting|
        new_setting = Setting.find_or_create_by!(
            key: setting[:key],
            value: setting[:value],
            active: setting[:active],
            user_id: new_user[:id]
        )
    end
end
