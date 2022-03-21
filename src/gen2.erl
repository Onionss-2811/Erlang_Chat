%% @author tukna
%% @doc @todo Add description to chat_server.


-module(gen2).
-behaviour(gen_server).

-export([start/0]).
-export([init/1, handle_call/3, handle_cast/2]).

start() ->
    Return = gen_server:start_link({local, gen2}, gen2, [], []),
    io:format("start_gen2: ~p~n", [Return]),
    Return.

%% init([]) ->
%% 	process_flag(trap_exit, true),
%%     spawn_link(gen1, start,[]),
%%     State = [],
%%     Return = {ok, State},
%%     io:format("init: ~p~n", [State]),
%%     Return.

init([]) ->
    State = [],
    Return = {ok, State},
    io:format("init: ~p~n", [State]),
    Return.

handle_call({send,Mess}, _From, State) ->
    io:format("Message: ~p ~n",[Mess]),
    {reply, gen_server:call(gen1, {m_receive, Mess}), State};


handle_call({m_receive,Mess}, _From, State) ->
    io:format("Message from gen1: ~p ~n",[Mess]),
    {reply, ok, State}.



handle_cast({send,Mess}, State) ->
    io:format("Receive msg from handle_cast: ~p~n", [Mess]),
    {noreply, State}.
