#[macro_use] extern crate rocket;

#[get("/hello")]
fn hello() -> &'static str {
    "Hello from {{crate_name}}"
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![hello])
}
