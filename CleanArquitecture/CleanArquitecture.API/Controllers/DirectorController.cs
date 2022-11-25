﻿using CleanArchitecture.Application.Features.Directors.Commands.CreateDirector;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace CleanArchitecture.API.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]")]
    public class DirectorController:ControllerBase
    {
        private IMediator _midiator;

        public DirectorController(IMediator midiator)
        {
            _midiator = midiator;
        }
        [HttpPost(Name ="CreateDirector")]
        [Authorize(Roles ="Administrator")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        public async Task<ActionResult<int>> CreateDirector([FromBody] CreateDirectorCommand command)
        {
            return await _midiator.Send(command);
        }
    }
}
