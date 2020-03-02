using System;
using System.Threading;
using Microsoft.AspNetCore.Mvc;

namespace backend.API.Controllers
{
    [Route("api/test")]
    [ApiController]
    public class TestController : ControllerBase
    {
        [HttpGet, Route("ok")]
        public IActionResult CounterEndpoint()
        {
            return Ok("ok");
        }

        [HttpGet, Route("timeout")]
        public IActionResult TimeoutEndpoint([FromQuery] int timeout = 10)
        {
            Thread.Sleep(TimeSpan.FromSeconds(timeout));
            return Ok("timeout");
        }
        
        [HttpGet, Route("internal-error")]
        public IActionResult InternalErrorEndpoint()
        {
            return StatusCode(500, "internal-error endpoint");
        }
        
        [HttpGet, Route("not-found")]
        public IActionResult NotFoundEndpoint()
        {
            return NotFound("not-found endpoint");
        }
        
        [HttpGet, Route("respond-with/{httpCode}")]
        public IActionResult RespondWithCodeGet(int httpCode)
        {
            return StatusCode(httpCode, "responded with " + httpCode);
        }
        
        [HttpPost, Route("respond-with/{httpCode}")]
        public IActionResult RespondWithCodePost(int httpCode)
        {
            return StatusCode(httpCode, "responded with " + httpCode);
        }
    }
}