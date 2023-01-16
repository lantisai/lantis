insert into auth.users (instance_id, id, aud, role, email, encrypted_password, raw_app_meta_data, raw_user_meta_data, email_confirmed_at, created_at)
  values ('00000000-0000-0000-0000-000000000000', '185f2f83-d63a-4c9b-b4a0-7e4a885799e2', 'authenticated', 'authenticated', 'bot@lantis.ai', '$2a$10$6gPtvpqCAiwavx1EOnjIgOykKMgzRdiBuejUQGIRRjvUi/ZgMh.9C', '{"provider":"email","providers":["email"]}', '{}', timezone('utc'::text, now()), timezone('utc'::text, now()));

insert into auth.identities (id, user_id, identity_data, provider, created_at)
  values ('185f2f83-d63a-4c9b-b4a0-7e4a885799e2', '185f2f83-d63a-4c9b-b4a0-7e4a885799e2',	'{"sub": "185f2f83-d63a-4c9b-b4a0-7e4a885799e2"}', 'email', timezone('utc'::text, now()));

insert into public.nodes (id, content, avatar_url, avatar_label)
values
(1, $$
# Challenge
Build and train a neural network as binary classificator from scratch.

# Questions
- what is neural network from first principles?
- what is backward propagation?
- what is gradient descent?
- how PyTorch works under the hood?
- how to visualize data as graphs?

# Prerequisites
- basic Python
- basic calculus
$$, null, null)
,(2, $$
# Preparation
You can setup your workspace any way you want, as long as it provides an interactive environment to execute Python code and view generated images. Our suggestion would be a Jupyter notebook.
$$, null, null)
,(3, $$
# Install Python
- install Miniconda3: https://docs.conda.io/en/latest/miniconda.html
- create a project directory: `mkdir my-project && cd my-project`
- create local python environment: `conda create --prefix ./envs`
- activate it: `conda activate ./envs`
$$, null, null)
,(4, $$
Independent researcher. Previously Director of AI at Tesla, OpenAI, CS231n, PhD @ Stanford. I like to train large deep neural nets
$$, 'https://karpathy.ai/assets/me_new.jpg', 'Andrej Karpathy')
,(5, $$
Happy software engineer on a journey to transform university education
$$, 'https://pbs.twimg.com/profile_images/1594792405844230150/A7NMk_NJ_400x400.jpg', 'Oleg Martynov')
on conflict (id) do update set content = excluded.content, attributes = excluded.attributes;

insert into public.edges (from_id, to_id, type)
values
(2, 1, 'reply')
,(3, 2, 'reply')
,(1, 4, 'author')
,(1, 5, 'author')
on conflict (from_id, to_id) do update set from_id = excluded.from_id, to_id = excluded.to_id, type = excluded.type;
