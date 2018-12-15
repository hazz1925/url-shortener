import React from "react"
import PropTypes from "prop-types"
import $ from "jquery"

class UrlForm extends React.Component {
  constructor(props) {
    console.log('construct');
    super(props);
    this.state = {
      shortUrl: ''
    }
    this.submit = this.submit.bind(this);
  }

  submit(e) {
    e.preventDefault();
    const url = $('#url').val();
    const token = this.props.token;
    const payload = {
      url,
      authenticity_token: token
    }

    $.ajax({
      method: 'POST',
      // dataType: 'json',
      // contentType: 'application/json',
      url: '/urls/create',
      data: payload,
    }).done((data) => {
      console.log(data);
      this.setState({
        shortUrl: data.link.short_url
      })
    }).fail((xhr, status, error) => {
      console.log(status, error);
    })
  }

  render() {
    return (
      <div className="url-form">
        <form id="create-url" onSubmit={this.submit}>
          <h4>Shorten A URL</h4>
          <input
            type="text"
            id="url"
            name="url"
          />
          <input
            type="hidden"
            name="authenticity_token"
            id="authenticity_token"
            value={this.props.token}
          />
          <button type="submit">Enter</button>
        </form>
        <p>Short Url: {this.state.shortUrl}</p>
      </div>
    );
  }
}

UrlForm.propTypes = {
  greeting: PropTypes.string
};

export default UrlForm
