INSERT INTO public.r_wf_process(id, created_by, created_date, deleted, modify_by, modify_date, name)
VALUES('ARTICLE_REVIEW', 'system', now()::DATE, false, NULL, NULL, 'PROCESS ARTICLE PUBLISHING');

INSERT INTO public.r_wf_state_type(id, created_by, created_date, deleted, modify_by, modify_date, name, optlock)
VALUES(1, 'system', now()::DATE, false, NULL, NULL, 'Start', 0);
INSERT INTO public.r_wf_state_type(id, created_by, created_date, deleted, modify_by, modify_date, name, optlock)
VALUES(2, 'system', now()::DATE, false, NULL, NULL, 'Normal', 0);
INSERT INTO public.r_wf_state_type(id, created_by, created_date, deleted, modify_by, modify_date, name, optlock)
VALUES(3, 'system', now()::DATE, false, NULL, NULL, 'Complete', 0);
INSERT INTO public.r_wf_state_type(id, created_by, created_date, deleted, modify_by, modify_date, name, optlock)
VALUES(4, 'system', now()::DATE, false, NULL, NULL, 'Denied', 0);
INSERT INTO public.r_wf_state_type(id, created_by, created_date, deleted, modify_by, modify_date, name, optlock)
VALUES(5, 'system', now()::DATE, false, NULL, NULL, 'Cancelled', 0);

--INSERT INTO public.r_wf_state(code, created_by, created_date, deleted, modify_by, modify_date, name, process_id, optlock)
--VALUES ('START', 'SYSTEM', now()::DATE, 'f', NULL, NULL, 'STATE FOR STARTING ARTICLE CREATION', 'ARTICLE_REVIEW', 0);
INSERT INTO public.r_wf_state(code, created_by, created_date, deleted, modify_by, modify_date, name, process_id, optlock, state_type)
VALUES ('DRAFT', 'SYSTEM', now()::DATE, 'f', NULL, NULL, 'STATE ARTICLE IN DRAFT CONDITION', 'ARTICLE_REVIEW', 0, 1);
INSERT INTO public.r_wf_state(code, created_by, created_date, deleted, modify_by, modify_date, name, process_id, optlock)
VALUES ('PENDING', 'SYSTEM', now()::DATE, 'f', NULL, NULL, 'STATE ARTICLE IN PENDING CONDITION', 'ARTICLE_REVIEW', 0, 2);
INSERT INTO public.r_wf_state(code, created_by, created_date, deleted, modify_by, modify_date, name, process_id, optlock)
VALUES ('PUBLISHED', 'SYSTEM', now()::DATE, 'f', NULL, NULL, 'STATE ARTICLE IN PUBLISHED CONDITION', 'ARTICLE_REVIEW', 0, 3);
INSERT INTO public.r_wf_state(code, created_by, created_date, deleted, modify_by, modify_date, name, process_id, optlock)
VALUES ('REJECTED', 'SYSTEM', now()::DATE, 'f', NULL, NULL, 'STATE ARTICLE IN REJECTED CONDITION', 'ARTICLE_REVIEW', 0, 4);
INSERT INTO public.r_wf_state(code, created_by, created_date, deleted, modify_by, modify_date, name, process_id, optlock)
VALUES ('CANCELLED', 'SYSTEM', now()::DATE, 'f', NULL, NULL, 'STATE ARTICLE IN CANCELLED CONDITION', 'ARTICLE_REVIEW', 0, 5);

INSERT INTO public.r_wf_user_task_type(id, created_by, created_date, deleted, modify_by, modify_date, "name", optlock)
VALUES(1, 'system', now()::date, false, null, null, 'APPROVE', 0);
INSERT INTO public.r_wf_user_task_type(id, created_by, created_date, deleted, modify_by, modify_date, "name", optlock)
VALUES(2, 'system', now()::date, false, null, null, 'DENY ', 0);
INSERT INTO public.r_wf_user_task_type(id, created_by, created_date, deleted, modify_by, modify_date, "name", optlock)
VALUES(3, 'system', now()::date, false, null, null, 'CANCEL', 0);
INSERT INTO public.r_wf_user_task_type(id, created_by, created_date, deleted, modify_by, modify_date, "name", optlock)
VALUES(4, 'system', now()::date, false, null, null, 'RESOLVE', 0);

INSERT INTO public.r_wf_user_task(id, created_by, created_date, deleted, modify_by, modify_date, description, "name", optlock, user_task_type, process)
VALUES(1, 'system', now()::DATE, false, NULL, NULL, 'EDITOR EDIT DRAFT ARTICLE', '', 0, 1, 'ARTICLE_REVIEW');
INSERT INTO public.r_wf_user_task(id, created_by, created_date, deleted, modify_by, modify_date, description, "name", optlock, user_task_type, process)
VALUES(2, 'system', now()::DATE, false, NULL, NULL, 'EDITOR SEND DRAFT ARTICLE', '', 0, 1, 'ARTICLE_REVIEW');
INSERT INTO public.r_wf_user_task(id, created_by, created_date, deleted, modify_by, modify_date, description, "name", optlock, user_task_type, process)
VALUES(3, 'system', now()::DATE, false, NULL, NULL, 'PUBLISHER REVIEW ARTICLE TO BE PUBLISHED OR REJECTED', '', 0, 1, 'ARTICLE_REVIEW');

INSERT INTO public.r_wf_transition(id, created_by, created_date, deleted, modify_by, modify_date, optlock, name, current_state, next_state, process_id)
VALUES (1, 'system', now()::date, 'f', NULL, NULL, 0, 'WAITING REVIEW', 'DRAFT', 'PENDING', 'ARTICLE_REVIEW');
INSERT INTO public.r_wf_transition(id, created_by, created_date, deleted, modify_by, modify_date, optlock, name, current_state, next_state, process_id)
VALUES (2, 'system', now()::date, 'f', NULL, NULL, 0, 'APPROVE ARTICLE', 'PENDING', 'PUBLISHED', 'ARTICLE_REVIEW');
INSERT INTO public.r_wf_transition(id, created_by, created_date, deleted, modify_by, modify_date, optlock, name, current_state, next_state, process_id)
VALUES (3, 'system', now()::date, 'f', NULL, NULL, 0, 'EDIT ARTICLE DRAFT ONLY', 'DRAFT', 'DRAFT', 'ARTICLE_REVIEW');

INSERT INTO public.r_wf_transition_user_task(id, created_by, created_date, deleted, modify_by, modify_date, optlock, user_task, transition)
VALUES(1, 'system', now()::DATE, false, NULL, NULL, 0, 1, 2);
INSERT INTO public.r_wf_transition_user_task(id, created_by, created_date, deleted, modify_by, modify_date, optlock, user_task, transition)
VALUES(2, 'system', now()::DATE, false, NULL, NULL, 0, 2, 3);
INSERT INTO public.r_wf_transition_user_task(id, created_by, created_date, deleted, modify_by, modify_date, optlock, user_task, transition)
VALUES(3, 'system', now()::DATE, false, NULL, NULL, 0, 3, 1);

INSERT INTO public.r_wf_group(id, created_by, created_date, deleted, modify_by, modify_date, "name", process_id)
VALUES(1, 'system', now()::DATE, false, NULL, NULL, 'READER', 'ARTICLE_REVIEW');
INSERT INTO public.r_wf_group(id, created_by, created_date, deleted, modify_by, modify_date, "name", process_id)
VALUES(2, 'system', now()::DATE, false, NULL, NULL, 'EDITOR', 'ARTICLE_REVIEW');
INSERT INTO public.r_wf_group(id, created_by, created_date, deleted, modify_by, modify_date, "name", process_id)
VALUES(3, 'system', now()::DATE, false, NULL, NULL, 'PUBLISHER', 'ARTICLE_REVIEW');

